// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



$(window).load(function() {
    document.getElementById('1').style.display = 'none';
    document.getElementById('2').style.display = 'none';
    document.getElementById('3').style.display = 'none';
    document.getElementById('4').style.display = 'none';
    document.getElementById('5').style.display = 'none';
});


function partySize(event) {
    if(this.selectedIndex == 0) {
        document.getElementById('1').style.display = 'none';
        document.getElementById('2').style.display = 'none';
        document.getElementById('3').style.display = 'none';
        document.getElementById('4').style.display = 'none';
        document.getElementById('5').style.display = 'none';
    } else if(this.selectedIndex == 1) {
        document.getElementById('1').style.display = 'block';
        document.getElementById('2').style.display = 'none';
        document.getElementById('3').style.display = 'none';
        document.getElementById('4').style.display = 'none';
        document.getElementById('5').style.display = 'none';
    } else if(this.selectedIndex == 2) {
        document.getElementById('1').style.display = 'block';
        document.getElementById('2').style.display = 'block';
        document.getElementById('3').style.display = 'none';
        document.getElementById('4').style.display = 'none';
        document.getElementById('5').style.display = 'none';
    } else if(this.selectedIndex == 3) {
        document.getElementById('1').style.display = 'block';
        document.getElementById('2').style.display = 'block';
        document.getElementById('3').style.display = 'block';
        document.getElementById('4').style.display = 'none';
        document.getElementById('5').style.display = 'none';
    } else if(this.selectedIndex == 4) {
        document.getElementById('1').style.display = 'block';
        document.getElementById('2').style.display = 'block';
        document.getElementById('3').style.display = 'block';
        document.getElementById('4').style.display = 'block';
        document.getElementById('5').style.display = 'none';
    } else if(this.selectedIndex == 5) {
        document.getElementById('1').style.display = 'block';
        document.getElementById('2').style.display = 'block';
        document.getElementById('3').style.display = 'block';
        document.getElementById('4').style.display = 'block';
        document.getElementById('5').style.display = 'block';
    }
}

function AlertIt() {
    confirm("This is not available for beta. Please send Save the Dates manually, one by one.")

}