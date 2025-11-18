@extends('backend.layouts.master')

@section('title','Media Manager')

@section('main-content')

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="font-weight-bold">Media Manager</h4>
        <ul class="breadcrumbs">
            <li><a href="{{route('admin')}}" style="color:#999">Dashboard</a></li>
            <li><a href="" class="active text-primary">Media Manager</a></li>
        </ul>
    </div>
    <div class="card-body">
        @include('backend.layouts.notification')
        
        <div class="row mb-3">
            <div class="col-md-12">
                <div class="alert alert-info">
                    <i class="fas fa-info-circle"></i> Quản lý tất cả ảnh đã upload trong hệ thống. Bạn có thể xem và xóa ảnh không cần thiết.
                </div>
            </div>
        </div>

        @if(count($images) > 0)
        <div class="row">
            @foreach($images as $image)
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-body p-2">
                        <div class="position-relative">
                            <img src="{{asset($image['path'])}}" 
                                 alt="{{$image['name']}}" 
                                 class="img-fluid w-100" 
                                 style="height: 200px; object-fit: cover; border-radius: 4px; cursor: pointer;"
                                 onclick="showImageModal('{{asset($image['path'])}}', '{{$image['name']}}')">
                            <div class="position-absolute top-0 right-0 m-2">
                                <span class="badge badge-secondary">{{$image['category']}}</span>
                            </div>
                        </div>
                        <div class="mt-2">
                            <small class="text-muted d-block" style="font-size: 11px; word-break: break-all;">
                                {{$image['name']}}
                            </small>
                            <small class="text-muted d-block mt-1">
                                {{number_format($image['size'] / 1024, 2)}} KB
                            </small>
                            <small class="text-muted d-block">
                                {{date('d/m/Y H:i', $image['modified'])}}
                            </small>
                        </div>
                        <div class="mt-2">
                            <button class="btn btn-sm btn-danger btn-block" 
                                    onclick="deleteImage('{{$image['path']}}', '{{$image['name']}}')">
                                <i class="fas fa-trash"></i> Xóa
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
        @else
        <div class="text-center py-5">
            <i class="fas fa-images fa-3x text-muted mb-3"></i>
            <p class="text-muted">Chưa có ảnh nào được upload.</p>
        </div>
        @endif
    </div>
</div>

<!-- Image Modal -->
<div class="modal fade" id="imageModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="imageModalTitle">Xem ảnh</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <img id="modalImage" src="" alt="" class="img-fluid">
            </div>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xác nhận xóa</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Bạn có chắc chắn muốn xóa ảnh <strong id="deleteImageName"></strong>?</p>
                <p class="text-danger"><small>Hành động này không thể hoàn tác!</small></p>
            </div>
            <div class="modal-footer">
                <form id="deleteForm" method="POST" action="{{route('file-manager.delete')}}">
                    @csrf
                    <input type="hidden" name="path" id="deleteImagePath">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script>
function showImageModal(imagePath, imageName) {
    document.getElementById('modalImage').src = imagePath;
    document.getElementById('imageModalTitle').textContent = imageName;
    $('#imageModal').modal('show');
}

function deleteImage(imagePath, imageName) {
    document.getElementById('deleteImagePath').value = imagePath;
    document.getElementById('deleteImageName').textContent = imageName;
    $('#deleteModal').modal('show');
}
</script>
@endpush

