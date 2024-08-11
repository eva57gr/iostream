


function f_Capitol_1127_col3() {
    // Variable declarations for each row in column 3
    var R400_C3 = $("#64_1127_69991_400_3");
    var sum_R400_C3 = 0.0;

    // List of row IDs excluding 400
    var rowIDs = [
        410, 411, 412, 413, 414, 415, 416, 417, 418, 419,
        420, 421, 422, 423, 424, 425, 426, 427, 428, 429,
        430, 431, 432, 433, 434, 435, 436, 437, 438, 439,
        440, 441, 442, 443, 444, 445, 446, 447, 448, 449,
        450, 451, 452, 453, 454, 455, 456, 457, 458, 459,
        460, 461, 462, 463, 464, 465, 466, 467, 468, 469,
        470, 471, 472, 473, 474, 475, 476, 477, 478, 479,
        480, 481, 482, 483, 484, 485, 486, 487, 488, 489,
        490, 491, 492, 493, 494, 495, 496, 497, 498, 499,
        500, 501, 502, 503, 504, 505, 506, 507, 508, 509,
        510, 511, 512, 513, 514, 515, 516, 517, 518, 519,
        520, 521, 522, 523, 524, 525, 526, 527, 528, 529,
        530, 531, 532, 533, 534, 535, 536, 537, 538, 539,
        540, 541, 542, 543, 544, 545, 546, 547, 548, 549,
        550, 551, 552, 553, 554, 555, 556, 557, 558, 559,
        560, 561, 562, 563, 564, 565, 566, 567, 568, 569,
        570, 571
    ];

    // Iterate over each row ID to declare variables and compute the sum
    rowIDs.forEach(function (rowID) {
        var variable = $("#64_1127_" + getMDID(rowID) + "_" + rowID + "_3");
        var value = parseFloat(variable.val()) || 0.0;
        sum_R400_C3 += value;
    });

    // Set R400_C3 to be readonly
    R400_C3.prop("readonly", true);

    // Update R400_C3 with the computed sum
    R400_C3.val(sum_R400_C3 === 0 ? "" : sum_R400_C3.toFixed(1));
}

// Helper function to retrieve the MDID based on rowID
function getMDID(rowID) {
    // This function should return the correct MDID for a given rowID
    // Replace the below mapping with the actual mapping
    var mdidMapping = {
        410: "70069",
        411: "70112",
        412: "70070",
        // ... Add all other mappings
        571: "70051"
    };
    return mdidMapping[rowID] || "UNKNOWN_MDID";
}
