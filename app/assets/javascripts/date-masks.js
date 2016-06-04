$(document).ready(function(){
  $(".date-mask").inputmask("d/m/y",{ "placeholder": "dd/mm/aaaa" });
  $(".time-mask").inputmask("hh:mm", {
        placeholder: "hh:mm",
        insertMode: false,
        showMaskOnHover: false,
        hourFormat: 24
      }
   );
});
