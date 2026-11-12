<div id="wordpress-doc" class="modal fade show" aria-modal="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title h6">{{ translate('Wordpress Import Documentation') }}</h4>
                <button type="button" class="btn btn-danger btn-square p-2 sm" data-dismiss="modal">x</button>
            </div>
            <div class="modal-body">
                <p>First, go to your Wordpress admin panel. Then install and active <b>Export any WordPress data to
                        XML/CSV</b> Plugin</p>
                <img src="{{ asset('public/wordpress-doc-image/wordpress-1.png') }}" alt="wordpress-img" class="mb-3">

                <p>Then a new option <b>All Export</b> will be available and click on that option.</p>
                <img src="{{ asset('public/wordpress-doc-image/wordpress-2.png') }}" alt="wordpress-img" class="mb-3">

                <p>Now select <b>Post</b> option from the dropdown and click <b>Customize Export File</b> button.</p>

                <img src="{{ asset('public/wordpress-doc-image/wordpress-3.png') }}" alt="wordpress-img" class="mb-3">
                <p>Now you can drag and drop all the field shown on the photo from <b>Available Data</b></p>

                <div class="d-flex row mb-4">
                    <div class="col-6">
                        <img src="{{ asset('public/wordpress-doc-image/wordpress-4.png') }}" alt="wordpress-img"
                            class="mb-3">
                        <p>From standard section you can get Title, Content, Excerpt, Date.</p>
                    </div>
                    <div class="col-6">
                        <img src="{{ asset('public/wordpress-doc-image/wordpress-6.png') }}" alt="wordpress-img"
                            class="mb-3">
                        <p>From taxonomies section you can get Categories and Tags.</p>
                    </div>
                    <div class="col-6">
                        <img src="{{ asset('public/wordpress-doc-image/wordpress-8.png') }}" alt="wordpress-img"
                            class="mb-3">
                        <p>From other section you can get Slug and Formate.</p>
                    </div>
                    <div class="col-6">
                        <img src="{{ asset('public/wordpress-doc-image/wordpress-5.png') }}" alt="wordpress-img"
                            class="mb-3">
                        <p>From Media > Images section you can get Featured Image</p>
                    </div>
                </div>

                <p>Now when you get all the fields, click <b>Continue Button</b>. You will be redirected to another page.</p>
                <img src="{{ asset('public/wordpress-doc-image/wordpress-11.png') }}" alt="wordpress-img" class="mb-3">

                <p>From this page you can select how many records you want to export, then click <b>Save & Run Export Button</b>.</p>
                <p>You will be redirected to another page, where the exporting will start</p>
                <img src="{{ asset('public/wordpress-doc-image/wordpress-10.png') }}" alt="wordpress-img" class="mb-3">
                <p>Now Click CSV and the exported file will start downloading</p>

                <p>Now come to our Export/Import module and upload that csv file. And click Import.</p>
                <img src="{{ asset('public/wordpress-doc-image/wordpress-12.png') }}" alt="wordpress-img" class="mb-4">

                <p class="mb-4"> <b>Note</b>: Your CSV file must have <b>Title</b> and <b>Slug</b> Header. If any row does not have title or slug it will be ignored.</p>
            </div>
        </div>
    </div>
</div>
