<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
     * Uploads an image to the public directory and returns its relative path.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string $field
     * @param  string $directory
     * @param  string|null $existingPath
     * @return string|null
     */
    protected function uploadImage(Request $request, string $field, string $directory, ?string $existingPath = null): ?string
    {
        if (!$request->hasFile($field)) {
            return $existingPath;
        }

        $file = $request->file($field);
        $directory = trim($directory, '/');
        $destinationPath = public_path($directory);

        if (!is_dir($destinationPath)) {
            mkdir($destinationPath, 0755, true);
        }

        $extension = strtolower($file->getClientOriginalExtension());
        $newFileName = uniqid($field . '_', true) . '.' . $extension;
        $file->move($destinationPath, $newFileName);

        if ($existingPath && Str::startsWith($existingPath, $directory)) {
            $oldFilePath = public_path($existingPath);
            if (file_exists($oldFilePath)) {
                @unlink($oldFilePath);
            }
        }

        return $directory . '/' . $newFileName;
    }
}
