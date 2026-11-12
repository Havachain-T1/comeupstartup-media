<div id="csv-doc" class="modal fade show" aria-modal="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title h6">{{ translate('CSV Documentation') }}</h4>
                <button type="button" class="btn btn-danger btn-square p-2 sm"
                    data-dismiss="modal">x</button>
            </div>
            <div class="modal-body">
                <p class="text-danger"> <b>Note</b>: Your CSV file must have <b>Title</b> and <b>Slug</b> Header. If any row does not have title or slug it will be ignored.</p>

                
                <table class="table table-borderless">
                    <thead>
                        <tr>
                            <th>Field</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Title</td>
                            <td>
                                <span><b>Data Type</b>: String, <b class="ml-2">Length</b>: 225</span>
                                <b>Required</b>
                                <span class="text-danger">Row will be not imported if this field is empty</span>
                            </td>
                        </tr>
                        <tr>
                            <td>Slug</td>
                            <td>
                                <span><b>Data Type</b>: String, <b class="ml-2">Length</b>: 225</span>
                                <b>Required</b>
                                <span class="text-danger">Row will be not imported if this field is empty</span>
                            </td>
                        </tr>
                        <tr>
                            <td>Excerpt</td>
                            <td>
                                <span><b>Data Type</b>: String</span>
                                <b>Optional</b>
                                <span>Post Short Description</span>
                            </td>
                        </tr>
                        <tr>
                            <td>Content</td>
                            <td>
                                <span><b>Data Type</b>: String</span>
                                <b>Optional</b>
                            </td>
                        </tr>
                        <tr>
                            <td>Image Featured</td>
                            <td>
                                <span><b>Data Type</b>: String</span>
                                <b>Optional</b>
                                <span>Example: https://images.unsplash.com/photo-1682687981630-cefe9cd73072</span>
                            </td>
                        </tr>
                        <tr>
                            <td>Format</td>
                            <td>
                                <span><b>Data Type</b>: String</span>
                                <b>Optional</b>
                                <span>Example: standard or video or audio or gallery</span>
                            </td>
                        </tr>
                        <tr>
                            <td>Date</td>
                            <td>
                                <span><b>Data Type</b>: String</span>
                                <b>Optional</b>
                                <span>Example: 2024-01-10 18:00:00</span>
                            </td>
                        </tr>
                        <tr>
                            <td>Categories</td>
                            <td>
                                <span><b>Data Type</b>: String</span>
                                <b>Optional</b>
                                <span>Example: <b>Single -</b> Economics, <b>Multiple -</b> Entertainment,Sports,Politics OR Entertainment|Sports|Politics</span>
                            </td>
                        </tr>
                        <tr>
                            <td>Tags</td>
                            <td>
                                <span><b>Data Type</b>: String</span>
                                <b>Optional</b>
                                <span>Example: <b>Single -</b> technology, <b>Multiple -</b> techology,politics,economy OR techology|politics|economy</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>