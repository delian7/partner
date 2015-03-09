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
        content: "<a href='/evaluations/export_evals.1'>Student Evaluation Data</a><br><a href='/evaluations/export_eval_summary.1'>Evaluation Summary Data</a>"
    })
});