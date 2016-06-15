function waysToChoose(num1,num2) {
  var options =  1;
  if (num1 < num2) {
    return 0;
  }

  else if(num1 === num2) {
    return 1;
  }

  else {
    for(i = 0; i < num2; i++) {
      options *= num1 -i; 
    }
  }
  return options;
}

console.log(waysToChoose(6,6));