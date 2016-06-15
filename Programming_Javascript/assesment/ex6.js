function occurAtLeast(num,words) {
  var arr_words = words.split(" ");
  var count = 0;
  var list = [];
  var new_word = arr_words[0];
  arr_words.forEach(function(word,index) {
    for(i = 0;length = arr_words.length, i < length; i++) {
      if (word === arr_words[i]) {
        count++;
      }
    }

    if (count >= num && !list.includes(word)) {
      list.push(word);
    }

    count = 0;
  });
  return list;
}

var words = "And when wind and winter harden, All the loveless land, It will whisper of the garden, You will understand";

console.log(occurAtLeast(3,words));