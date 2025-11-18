<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Settings;
use App\User;
use App\Rules\MatchOldPassword;
use Hash;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Spatie\Activitylog\Models\Activity;
class AdminController extends Controller
{
    public function index(){
        $data = User::select(\DB::raw("COUNT(*) as count"), \DB::raw("DAYNAME(created_at) as day_name"), \DB::raw("DAY(created_at) as day"))
        ->where('created_at', '>', Carbon::today()->subDay(6))
        ->groupBy('day_name','day')
        ->orderBy('day')
        ->get();
     $array[] = ['Name', 'Number'];
     foreach($data as $key => $value)
     {
       $array[++$key] = [$value->day_name, $value->count];
     }
    //  return $data;
     return view('backend.index')->with('users', json_encode($array));
    }

    public function profile(){
        $profile=Auth()->user();
        // return $profile;
        return view('backend.users.profile')->with('profile',$profile);
    }

    public function profileUpdate(Request $request,$id){
        $user = User::findOrFail($id);

        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'photo' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        $data = ['name' => $validatedData['name']];

        $uploadedPhoto = $this->uploadImage($request, 'photo', 'uploads/profiles', $user->photo);
        if ($uploadedPhoto) {
            $data['photo'] = $uploadedPhoto;
        }

        $status=$user->fill($data)->save();
        if($status){
            request()->session()->flash('success','Cập nhật thông tin cá nhân thành công');
        }
        else{
            request()->session()->flash('error','Vui lòng thử lại!');
        }
        return redirect()->back();
    }

    public function settings(){
        $data=Settings::first();
        return view('backend.setting')->with('data',$data);
    }

    public function settingsUpdate(Request $request){
        // return $request->all();
        $this->validate($request,[
            'short_des'=>'required|string',
            'description'=>'required|string',
            'photo'=>'nullable|image|mimes:jpg,jpeg,png|max:4096',
            'logo'=>'nullable|image|mimes:jpg,jpeg,png|max:4096',
            'address'=>'required|string',
            'email'=>'required|email',
            'phone'=>'required|string',
        ]);
        $settings=Settings::first();
        $data=$request->except(['photo','logo']);
        $data['logo']=$this->uploadImage($request,'logo','uploads/settings',$settings->logo);
        $data['photo']=$this->uploadImage($request,'photo','uploads/settings',$settings->photo);
        $status=$settings->fill($data)->save();
        if($status){
            request()->session()->flash('success','Cập nhật cài đặt thành công');
        }
        else{
            request()->session()->flash('error','Vui lòng thử lại');
        }
        return redirect()->route('admin');
    }

    public function changePassword(){
        return view('backend.layouts.changePassword');
    }
    public function changPasswordStore(Request $request)
    {
        $request->validate([
            'current_password' => ['required', new MatchOldPassword],
            'new_password' => ['required'],
            'new_confirm_password' => ['same:new_password'],
        ]);

        User::find(auth()->user()->id)->update(['password'=> Hash::make($request->new_password)]);

        return redirect()->route('admin')->with('success','thay đổi mật khẩu thành công');
    }

    // Pie chart
    public function userPieChart(Request $request){
        // dd($request->all());
        $data = User::select(\DB::raw("COUNT(*) as count"), \DB::raw("DAYNAME(created_at) as day_name"), \DB::raw("DAY(created_at) as day"))
        ->where('created_at', '>', Carbon::today()->subDay(6))
        ->groupBy('day_name','day')
        ->orderBy('day')
        ->get();
     $array[] = ['Name', 'Number'];
     foreach($data as $key => $value)
     {
       $array[++$key] = [$value->day_name, $value->count];
     }
    //  return $data;
     return view('backend.index')->with('course', json_encode($array));
    }

    // Media Manager
    public function fileManager(){
        $uploadDirs = ['banners', 'products', 'posts', 'profiles', 'users', 'settings', 'categories'];
        $images = [];
        
        foreach($uploadDirs as $dir){
            $dirPath = public_path('uploads/' . $dir);
            if(is_dir($dirPath)){
                $files = glob($dirPath . '/*.{jpg,jpeg,png,gif,JPG,JPEG,PNG,GIF}', GLOB_BRACE);
                foreach($files as $file){
                    $images[] = [
                        'path' => 'uploads/' . $dir . '/' . basename($file),
                        'name' => basename($file),
                        'size' => filesize($file),
                        'modified' => filemtime($file),
                        'category' => $dir
                    ];
                }
            }
        }
        
        // Sắp xếp theo thời gian sửa đổi mới nhất
        usort($images, function($a, $b) {
            return $b['modified'] - $a['modified'];
        });
        
        return view('backend.media.index')->with('images', $images);
    }

    // Delete image
    public function deleteImage(Request $request){
        $path = $request->input('path');
        if($path && Str::startsWith($path, 'uploads/')){
            $filePath = public_path($path);
            if(file_exists($filePath) && is_file($filePath)){
                @unlink($filePath);
                request()->session()->flash('success','Xóa ảnh thành công');
            } else {
                request()->session()->flash('error','Không tìm thấy file');
            }
        } else {
            request()->session()->flash('error','Đường dẫn không hợp lệ');
        }
        return redirect()->route('file-manager');
    }

    // public function activity(){
    //     return Activity::all();
    //     $activity= Activity::all();
    //     return view('backend.layouts.activity')->with('activities',$activity);
    // }
}
