
      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Arvila {{date('Y')}}</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="{{asset('backend/vendor/jquery/jquery.min.js')}}"></script>
  <script src="{{asset('backend/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

  <!-- Core plugin JavaScript-->
  <script src="{{asset('backend/vendor/jquery-easing/jquery.easing.min.js')}}"></script>

  <!-- Custom scripts for all pages-->
  <script src="{{asset('backend/js/sb-admin-2.min.js')}}"></script>

  <!-- Page level plugins -->
  <script src="{{asset('backend/vendor/chart.js/Chart.min.js')}}"></script>

  <!-- Page level custom scripts -->
  {{-- <script src="{{asset('backend/js/demo/chart-area-demo.js')}}"></script> --}}
  {{-- <script src="{{asset('backend/js/demo/chart-pie-demo.js')}}"></script> --}}

  @stack('scripts')

  <script>
    setTimeout(function(){
      $('.alert').slideUp();
    },4000);
  </script>
<script>
(function () {
    function resetPreview(previewEl, labelEl) {
        if (labelEl) {
            labelEl.textContent = 'Lựa chọn ảnh';
        }
        if (previewEl) {
            previewEl.style.display = 'none';
            previewEl.removeAttribute('src');
        }
    }

    function handleInputChange(event) {
        const inputEl = event.target;
        const previewSelector = inputEl.getAttribute('data-preview-target');
        const labelSelector = inputEl.getAttribute('data-label-target');
        const previewEl = previewSelector ? document.querySelector(previewSelector) : null;
        const labelEl = labelSelector ? document.querySelector(labelSelector) : null;
        const file = inputEl.files && inputEl.files[0] ? inputEl.files[0] : null;

        if (!file) {
            resetPreview(previewEl, labelEl);
            return;
        }

        if (!['image/jpeg', 'image/png'].includes(file.type)) {
            alert('Chỉ hỗ trợ định dạng JPG hoặc PNG.');
            inputEl.value = '';
            resetPreview(previewEl, labelEl);
            return;
        }

        if (labelEl) {
            labelEl.textContent = file.name;
        }

        if (previewEl) {
            const reader = new FileReader();
            reader.onload = function (e) {
                previewEl.src = e.target.result;
                previewEl.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    }

    function initImageInputs(scope) {
        const inputs = (scope || document).querySelectorAll('.image-input');
        inputs.forEach(function (inputEl) {
            inputEl.removeEventListener('change', handleInputChange);
            inputEl.addEventListener('change', handleInputChange);
        });
    }

    document.addEventListener('DOMContentLoaded', function () {
        initImageInputs(document);
        window.initImageInputs = initImageInputs;
    });
})();
</script>
