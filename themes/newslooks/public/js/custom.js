/* It's the best idea to write your own JS in custom.js file. So if you want to write JS with your own use this file */
(function ($) {
  "use strict";

  // Setting Up CSRF Token For Ajax Request
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="_token"]').attr("content"),
    },
  });

  $(document).ready(function () {
    // Change Language
    $(".change-lang").on("click", function (e) {
      e.preventDefault();

      let value = $(this).data("lang");
      let url = $(this).data("url");
      if (value) {
        $.post(url, { lang: value }, function (data) {
          location.reload();
        });
      }
    });

    // Voting Widget
    $(".voting-btn").on("click", function () {
      let vote_btn = $(this);
      let option = $(".voting-input:checked").not(":disabled").val();
      let url = $(this).data("url");
      let type = $(this).data("type");
      let prevOption = $(this).data("prevOption");

      if (option) {
        $.ajax({
          type: "post",
          url: url,
          data: {
            option: option,
            type: type,
            prevOption: prevOption ? prevOption:false
          },
          success: function (res) {
            voteCalculation(res.options);
            cssModification(option, type, prevOption);

            // Update Button Text And Data Attribute
            vote_btn.text(res.text);
            vote_btn.data("type", "change_vote");
            vote_btn.data("prevOption", option);
          },

          error: function (data, textStatus, jqXHR) {},
        });
      }
    });

    // Change Vote
    $(".change_vote_btn").on("click", function () {});
  });

  // Voting Calculation
  function voteCalculation(options) {
    $(options).each(function (index, element) {
      let poll = $('div[data-option="' + element.id + '"]');
      poll
        .find(".percentage")
        .attr(
          "style",
          "width: " + (100 - (parseInt(element.percentage) + 2)) + "%;"
        );

      poll.find(".percentage-text").text(element.percentage + "%");
    });
  }

  // Voting CSS Modified
  function cssModification(option, type, prevOption) {
    let option_element = $('div[data-option="' + option + '"]');
    // Add Border
    option_element.css({
      border: "1px solid #f64a1d",
    });

    // Disabled Input
    option_element.find("input").prop("disabled", true).prop("readonly", true);

    // Not Allowed Label
    option_element.find("label").css({
      cursor: "not-allowed",
    });

    if(type == 'change_vote'){
      let prev_option_element = $('div[data-option="' + prevOption + '"]');
      // Add Border
      prev_option_element.attr('style', '');
  
      // Disabled Input
      prev_option_element.find("input").prop("disabled", false).prop("readonly", false);
  
      // Not Allowed Label
      prev_option_element.find("label").attr('style', '');
    }
  }

  // End Of Script
})(jQuery);
