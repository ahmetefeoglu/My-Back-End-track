$(function() {
  function LargestSequence(num,sequence) {
    //sort the array in an descending order
    sequence.sort(function(a,b) {
      return b-a;
    });
    
    //return the k largest integer
    return sequence.slice(0,num); 
  }

  console.log(LargestSequence(5,[100,40,50,120,30,29,331]));
})