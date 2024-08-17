function checkIntervalForAllRows() {
    // List of all rows in Capitol 312 to check
    var rowsToCheck = [
        { id: "68670", rind: "001" }, { id: "68663", rind: "002" }, { id: "68689", rind: "051" },
        { id: "68700", rind: "031" }, { id: "68691", rind: "112" }, { id: "68675", rind: "398" },
        { id: "68705", rind: "417" }, { id: "68708", rind: "643" }, { id: "68649", rind: "762" },
        { id: "68680", rind: "795" }, { id: "68650", rind: "804" }, { id: "68656", rind: "860" },
        { id: "68652", rind: "999" }, { id: "68645", rind: "040" }, { id: "68671", rind: "008" },
        { id: "68690", rind: "056" }, { id: "68683", rind: "070" }, { id: "68701", rind: "100" },
        { id: "68658", rind: "191" }, { id: "68702", rind: "208" }, { id: "68697", rind: "756" },
        { id: "68659", rind: "233" }, { id: "68660", rind: "246" }, { id: "68668", rind: "784" },
        { id: "68684", rind: "250" }, { id: "68646", rind: "268" }, { id: "68703", rind: "276" },
        { id: "68666", rind: "300" }, { id: "68674", rind: "372" }, { id: "68704", rind: "380" },
        { id: "68706", rind: "428" }, { id: "68685", rind: "440" }, { id: "68676", rind: "442" },
        { id: "68654", rind: "499" }, { id: "68694", rind: "578" }, { id: "68677", rind: "528" },
        { id: "68648", rind: "616" }, { id: "68707", rind: "620" }, { id: "68681", rind: "826" },
        { id: "68672", rind: "203" }, { id: "68686", rind: "642" }, { id: "68695", rind: "688" },
        { id: "68696", rind: "703" }, { id: "68678", rind: "705" }, { id: "68679", rind: "724" },
        { id: "68662", rind: "752" }, { id: "68667", rind: "348" }, { id: "68688", rind: "007" },
        { id: "68687", rind: "792" }, { id: "68655", rind: "807" }, { id: "68647", rind: "376" },
        { id: "68693", rind: "156" }, { id: "68661", rind: "392" }, { id: "68698", rind: "006" },
        { id: "68692", rind: "124" }, { id: "68651", rind: "840" }, { id: "68665", rind: "021" },
        { id: "68682", rind: "013" }, { id: "68664", rind: "005" }, { id: "68699", rind: "009" },
        { id: "68673", rind: "368" }, { id: "68653", rind: "364" }
    ];

    // Iterate through each row and perform the check
    rowsToCheck.forEach(function (row) {
        var col1 = parseFloat($("#5_312_" + row.id + "_" + row.rind + "_1").val()) || 0.0;
        var col2 = parseInt($("#5_312_" + row.id + "_" + row.rind + "_2").val()) || 0;

        if (col2 !== 0) {  // Avoid division by zero
            var result = (col1 / col2) * 1000;
            if (result < 17.00 || result > 19.80) {
                alert('Rind. ' + row.rind + ': ' + result.toFixed(4) + ' nu apartine intervalului [17.00-19.80]');
            }
        }
    });
}

// Update the main function to include the new logic
function f_Capitol_312() {
    // Execute the custom functions
    sumRind002();
    sumCapIII_Rind999();
    calculateRow001();
    checkIntervalForAllRows();  // Check the interval for all rows
}

// Ensure f_Capitol_312 is called on document ready and input changes as per original code
$(document).ready(function () {
    f_Capitol_312();
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", f_Capitol_312);
    $(document).on("change", "input:not([type='button']):not([readonly]):not([disabled])", f_Capitol_312);
});
