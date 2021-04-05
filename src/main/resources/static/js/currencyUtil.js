function Fen2Yuan(num) {
    if (typeof num !== "number" || isNaN(num)) return null;
    return ( num / 100 ).toFixed(2);
}

function MilliLiToYuan(num) {
    if (typeof num !== "number" || isNaN(num)) return null;
    return formatCurrency(( num / 100 ).toFixed(2));
}

function MilliLiToYuan3Decimal(num) {
    if (typeof num !== "number" || isNaN(num)) return null;
    return formatCurrency3Decimal(( num / 100 ).toFixed(3));
}

/**
 * 将数值四舍五入(保留2位小数)后格式化成金额形式
 *
 * @param num 数值(Number或者String)
 * @return 金额格式的字符串,如'1,234,567.45'
 * @type String
 */
function formatCurrency(num) {
    num = num.toString().replace(/\$|\,/g, '');
    if (isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num * 100 + 0.50000000001);
    cents = num % 100;
    num = Math.floor(num / 100).toString();
    if (cents < 10)
        cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
        num = num.substring(0, num.length - (4 * i + 3)) + ',' +
            num.substring(num.length - (4 * i + 3));
    return (((sign) ? '' : '-') + num + '.' + cents);
}

function formatCurrency3Decimal(num) {
    num = num.toString().replace(/\$|\,/g, '');
    if (isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num * 1000 + 0.50000000001);
    cents = num % 1000;
    num = Math.floor(num / 1000).toString();
    if (cents < 10) {
        cents = "00" + cents;
    } else if (cents >= 10 && cents < 100) {
        cents = "0" + cents;
    }
    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
        num = num.substring(0, num.length - (4 * i + 3)) + ',' +
            num.substring(num.length - (4 * i + 3));
    return (((sign) ? '' : '-') + num + '.' + cents);
}