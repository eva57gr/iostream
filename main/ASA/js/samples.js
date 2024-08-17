

function sumRind002() {
    // Row IDs for Rind.002 summation
    var rowIDs = [
        { id: "68689", rind: "051" }, { id: "68700", rind: "031" }, { id: "68691", rind: "112" },
        { id: "68675", rind: "398" }, { id: "68705", rind: "417" }, { id: "68708", rind: "643" },
        { id: "68649", rind: "762" }, { id: "68680", rind: "795" }, { id: "68650", rind: "804" },
        { id: "68656", rind: "860" }
    ];
    var sumCol1 = 0.0;
    var sumCol2 = 0;

    // Calculate the sums
    rowIDs.forEach(function (row) {
        var col1Val = parseFloat($("#5_312_" + row.id + "_" + row.rind + "_1").val()) || 0.0;
        var col2Val = parseInt($("#5_312_" + row.id + "_" + row.rind + "_2").val()) || 0;
        sumCol1 += col1Val;
        sumCol2 += col2Val;
    });

    // Apply rounding and set the values
    var rind002Col1 = $("#5_312_68663_002_1");
    var rind002Col2 = $("#5_312_68663_002_2");

    rind002Col1.val(sumCol1 !== 0 ? sumCol1.toFixed(1) : ""); // Assign empty string if sum is 0
    rind002Col2.val(sumCol2 !== 0 ? sumCol2 : ""); // Assign empty string if sum is 0

    // Make Rind.002 columns read-only
    rind002Col1.prop("readonly", true);
    rind002Col2.prop("readonly", true);
}

function sumCapIII_Rind999() {
    // Row IDs for Cap. III, Rind.999 summation
    var rowIDs = [
        { id: "68645", rind: "040" }, { id: "68671", rind: "008" }, { id: "68690", rind: "056" },
        { id: "68683", rind: "070" }, { id: "68701", rind: "100" }, { id: "68658", rind: "191" },
        { id: "68702", rind: "208" }, { id: "68697", rind: "756" }, { id: "68659", rind: "233" },
        { id: "68660", rind: "246" }, { id: "68668", rind: "784" }, { id: "68684", rind: "250" },
        { id: "68646", rind: "268" }, { id: "68703", rind: "276" }, { id: "68666", rind: "300" },
        { id: "68674", rind: "372" }, { id: "68704", rind: "380" }, { id: "68706", rind: "428" },
        { id: "68685", rind: "440" }, { id: "68676", rind: "442" }, { id: "68654", rind: "499" },
        { id: "68694", rind: "578" }, { id: "68677", rind: "528" }, { id: "68648", rind: "616" },
        { id: "68707", rind: "620" }, { id: "68681", rind: "826" }, { id: "68672", rind: "203" },
        { id: "68686", rind: "642" }, { id: "68695", rind: "688" }, { id: "68696", rind: "703" },
        { id: "68678", rind: "705" }, { id: "68679", rind: "724" }, { id: "68662", rind: "752" },
        { id: "68667", rind: "348" }, { id: "68688", rind: "007" }, { id: "68687", rind: "792" },
        { id: "68655", rind: "807" }, { id: "68647", rind: "376" }, { id: "68693", rind: "156" },
        { id: "68661", rind: "392" }, { id: "68698", rind: "006" }, { id: "68692", rind: "124" },
        { id: "68651", rind: "840" }, { id: "68665", rind: "021" }, { id: "68682", rind: "013" },
        { id: "68664", rind: "005" }, { id: "68699", rind: "009" }, { id: "68673", rind: "368" },
        { id: "68653", rind: "364" }
    ];
    var sumCol1 = 0.0;
    var sumCol2 = 0;

    // Calculate the sums
    rowIDs.forEach(function (row) {
        var col1Val = parseFloat($("#5_312_" + row.id + "_" + row.rind + "_1").val()) || 0.0;
        var col2Val = parseInt($("#5_312_" + row.id + "_" + row.rind + "_2").val()) || 0;
        sumCol1 += col1Val;
        sumCol2 += col2Val;
    });

    // Apply rounding and set the values
    var rind999Col1 = $("#5_312_68652_999_1");
    var rind999Col2 = $("#5_312_68652_999_2");

    rind999Col1.val(sumCol1 !== 0 ? sumCol1.toFixed(1) : ""); // Assign empty string if sum is 0
    rind999Col2.val(sumCol2 !== 0 ? sumCol2 : ""); // Assign empty string if sum is 0

    // Make Rind.999 columns read-only
    rind999Col1.prop("readonly", true);
    rind999Col2.prop("readonly", true);
}

function calculateRow001() {
    // Get values for Row.002
    var row002Col1 = parseFloat($("#5_312_68663_002_1").val()) || 0.0;
    var row002Col2 = parseInt($("#5_312_68663_002_2").val()) || 0;

    // Get values for Row.999
    var row999Col1 = parseFloat($("#5_312_68652_999_1").val()) || 0.0;
    var row999Col2 = parseInt($("#5_312_68652_999_2").val()) || 0;

    // Calculate Row.001 as the sum of Row.002 and Row.999
    var row001Col1 = row002Col1 + row999Col1;
    var row001Col2 = row002Col2 + row999Col2;

    // Apply rounding and set the values
    var rind001Col1 = $("#5_312_68670_001_1");
    var rind001Col2 = $("#5_312_68670_001_2");

    rind001Col1.val(row001Col1 !== 0 ? row001Col1.toFixed(1) : ""); // Assign empty string if sum is 0
    rind001Col2.val(row001Col2 !== 0 ? row001Col2 : ""); // Assign empty string if sum is 0

    // Make Rind.001 columns read-only
    rind001Col1.prop("readonly", true);
    rind001Col2.prop("readonly", true);
}

// Update the main function to include the new logic
function f_Capitol_312() {
    // Execute the custom functions
    sumRind002();
    sumCapIII_Rind999();
    calculateRow001();
}

var from = "";
// Ensure f_Capitol_312 is called on document ready and input changes as per original code
$(document).ready(function () {

    // Initialize form variable
    from = $("#formDenShort").val();
    f_Capitol_312();
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", f_Capitol_312);
    $(document).on("change", "input:not([type='button']):not([readonly]):not([disabled])", f_Capitol_312);
});
