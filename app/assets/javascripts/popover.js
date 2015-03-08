$(function() {
    $('.info-popover').popover({
        html: true
    })
});
$(function() {
    $('.export-popover').popover({
        html: true,
        title: "Export CSV of",
        content: "<a href='/users/export_ungrouped.1'>Ungrouped Students</a><br><a href='/users/export_groups.1'>Partnerships and Groups</a>"
    })
});
$(function() {
    $('.export-eval-popover').popover({
        html: true,
        title: "Export CSV of",
        content: "<a href='/evaluations/export_evals.1'>Student Evaluations</a>"
    })
});

$(document).on('change', '.btn-file :file', function() {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
    if ($('#fileupload').val() != "")
        $('#csvbutton').attr('disabled', false);
    else
        $('#csvbuton').attr('disabled', true);

});

$(document).ready(function() {
    $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
        var input = $(this).parents('.input-group').find(':text'),
            log = numFiles > 1 ? numFiles + ' files selected' : label;
        if (input.length) {
            input.val(log);
        } else {
            if (log) alert(log);
        }
    });
    $('#csvbutton').on('click', function() {
        $(this).button('loading') 
    })
});