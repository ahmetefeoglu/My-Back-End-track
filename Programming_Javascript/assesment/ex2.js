$(function() {
  function convertToGrade(num) {
    if (num >= 80) {
      return "A";
    }

    else if (num < 80 && num >= 70) {
      return "B";
    }

    else if(num < 70 && num >= 60) {
      return "C";
    }

    else if(num < 60 && num >= 50) {
      return "D";
    }

    else {
      return "F";
    }
  }

  
})