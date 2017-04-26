var table_data = [ { first_name : 'Rose',
                     last_name  : 'Tyler',
                     home       : 'Earth' },
                   { first_name : 'Zoe',
                     last_name  : 'Heriot',
                     home       : 'Space Station W3'},
                   { first_name : 'Jo',
                     last_name  : 'Grant',
                     home       : 'Earth'},
                   { first_name : 'Leela',
                     last_name  : null,
                     home       : 'Unspecified'},
                   { first_name : 'Romana',
                     last_name  : null,
                     home       : 'Gallifrey'},
                   { first_name : 'Clara',
                     last_name  : 'Oswald',
                     home       : 'Earth'},
                   { first_name : 'Adric',
                     last_name  : null,
                     home       : 'Alzarius'},
                   { first_name : 'Susan',
                     last_name  : 'Foreman',
                     home       : 'Gallifrey'} ];


function tableBuildRight() {
    buildTable($("#myTableRight"))
}

function tableBuildCenter() {
    buildTable($("#myTableCenter"))
}

function tableBuildLeft() {
    buildTable($("#myTableLeft"))
}

function tableBuildFooter() {
    $("#footer").html('');
    for (var i = 0; i < table_data.length; i++) {
        $("#footer").append(table_data[i]['first_name'] +
                            ' ' + table_data[i]['last_name'] +
                            ' from ' + table_data[i]['home'] + ' | ');
    };
}

function buildTable(table){
    table.html('');
    table.append('<thead><tr><th>First Name</th><th>'
                             + 'Last Name</th><th>Home</th></tr></thead>'
                             + '<tbody></tbody>');
    for (var i = 0; i < table_data.length; i++) {
        table.append('<tr><td>' + table_data[i]['first_name']
                                + '</td><td>' + table_data[i]['last_name']
                                + '</td><td>' + table_data[i]['home']
                                + '</td></tr>');
    };
}


$('#buttonRight').click(tableBuildRight)
$('#buttonLeft').click(tableBuildLeft)
$('#buttonCenter').click(tableBuildCenter)
$('#buttonFooter').click(tableBuildFooter)
