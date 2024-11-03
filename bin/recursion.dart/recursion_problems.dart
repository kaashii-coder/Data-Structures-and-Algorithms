
//!  checking paliandrome function
ispalindrome(String word) {
  if (word.length <= 1) {
    return true;
  } else if (word[0] != word[word.length - 1]) {
    return false;
  } else {
    return ispalindrome(word.substring(1, word.length - 1));
  }
}
//! string reversing function
stringReverse(String word) {
  if (word.length <= 1) {
    return word;
  } else {
    return stringReverse(word.substring(1)) + word[0];
  }
}
//!string length counting function
stringLengthTaker(String word) {
  if (word.length <= 1) {
    return 1;
  } else {
    return 1 + stringLengthTaker(word.substring(1));
  }
}
//! check charactor count function
specificLetterCount(String word, String l) {
  if (word.length <= 1) {
    return 0;
  } else if (word[0] == l) {
    return 1 + specificLetterCount(word.substring(1), l);
  } else {
    return specificLetterCount(word.substring(1), l);
  }
}

void main() {
  print(ispalindrome('racecar'));
  print(stringReverse('akash'));
  print(stringLengthTaker('akash'));
  print(specificLetterCount('akash', 'a'));
}
