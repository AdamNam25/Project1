@php
    $fieldName = $name ?? 'photo';
    $inputId = $id ?? ($fieldName . '_' . uniqid());
    $labelText = $label ?? 'Ảnh';
    $requiredMark = !empty($required) ? ' <span class="text-danger">*</span>' : '';
    $buttonLabel = $buttonText ?? 'Lựa chọn ảnh';
    $acceptTypes = $accept ?? '.jpg,.jpeg,.png';
    $existingPhoto = $value ?? null;
    if ($existingPhoto && !preg_match('/^https?:\/\//', $existingPhoto)) {
        $existingPhoto = \Illuminate\Support\Str::startsWith($existingPhoto, '/') ? $existingPhoto : asset($existingPhoto);
    }
@endphp

<div class="form-group">
    <label class="col-form-label" for="{{ $inputId }}">{!! $labelText !!}{!! $requiredMark !!}</label>
    <div class="custom-file">
        <input type="file"
               name="{{ $fieldName }}"
               id="{{ $inputId }}"
               class="custom-file-input image-input"
               accept="{{ $acceptTypes }}"
               {{ !empty($required) ? 'required' : '' }}
               data-preview-target="#preview-{{ $inputId }}"
               data-label-target="#label-{{ $inputId }}">
        <label class="custom-file-label" id="label-{{ $inputId }}" for="{{ $inputId }}">{{ $buttonLabel }}</label>
    </div>
    <div class="mt-3">
        <img id="preview-{{ $inputId }}"
             src="{{ $existingPhoto ?? '' }}"
             alt="preview"
             class="img-fluid border rounded"
             style="max-height:150px; {{ $existingPhoto ? '' : 'display:none;' }}">
    </div>
    @error($fieldName)
    <span class="text-danger">{{$message}}</span>
    @enderror
</div>

