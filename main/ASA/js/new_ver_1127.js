var from = "";


$(document).ready(function () {

    // Initialize form variable
    from = $("#formDenShort").val();
    initializeForm();
    calculateAll();

    // Attach event listeners to input fields
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function () {
        calculateAll();
    });

    // Handle dynamically added rows
    $(document).on("change", "input:not([type='button']):not([readonly]):not([disabled])", function () {
        calculateAll();
    });
});

function initializeForm() {
    // Initialize form variable and make the row 400 fields read-only
    $("#64_1127_69986_400_3, #64_1127_69986_400_4, #64_1127_69986_400_5").prop("readonly", true);
}

function calculateAll() {
    calculateSum(3);
    calculateSum(4);
    calculateSum(5);
}

function getFieldValue(selector) {
    return parseFloat($(selector).val()) || 0.0;
}

function calculateSum(column) {
    let sum = 0.0;
    for (let i = 410; i <= 571; i++) {
        let id = `#64_1127_${formatRowId(i)}_${i}_${column}`;
        sum += getFieldValue(id);
    }
    $(`#64_1127_69986_400_${column}`).val(sum === 0 ? "" : sum.toFixed(column === 4 ? 0 : 1));
}

function formatRowId(row) {
    // Example to ensure row id is formatted correctly
    // This can be adjusted based on the actual format of the row ID
    return row.toString().padStart(5, '0');
}
