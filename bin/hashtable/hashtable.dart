class HashTable<K, V> {
  int length;
  List<List<Entry<K, V>>> bucket = <List<Entry<K, V>>>[];
  HashTable({required this.length}) {
    bucket = List.generate(length, (index) => []);
  }
  int hash(K key) {
    return key.hashCode % length;
  }

  //! Hashtable data adding function
  add(K key, V value) {
    Entry<K, V> entry = Entry(key: key, value: value);
    int index = hash(key);

    for (var element in bucket[index]) {
      if (element.key == key) {
        return;
      }
    }

    bucket[index].add(entry);
  }

  //! Remove Duplicates in String function
  removeDuplicates(List<K> word) {
    for (var i = 0; i < word.length; i++) {
      int index = hash(word[i]);
      int flag = 0;
      for (var element in bucket[index]) {
        if (element.key == word[i]) {
          flag = 1;
        }
      }
      if (flag == 0) {
        add(word[i], true as V);
      }
    }
  }

  //! Key used to find value function
  keyUseToFindValue(K key) {
    int index = hash(key);
    for (var element in bucket[index]) {
      if (element.key == key) {
        return element.value;
      }
    }
  }

  //! Find the frequency of each letters in a string fuction
  frequency(List<K> letters) {
    Map<String, int> frequecy = {};
    for (var i = 0; i < letters.length; i++) {
      Entry<K, V> entry = Entry(key: letters[i], value: 'true' as V);
      int index = hash(letters[i]);
      int count = 1;
      int flag = 0;
      for (var element in bucket[index]) {
        if (element.key == letters[i]) {
          count++;
          flag = 1;
        }
      }
      frequecy[letters[i] as String] = count;
      if (flag == 0) {
        bucket[index].add(entry);
      }
    }
    print(frequecy);
  }

  //! Display function
  display() {
    for (var i = 0; i < bucket.length; i++) {
      for (var element in bucket[i]) {
        print(element.key);
      }
    }
  }
}

//! like a map or node data
class Entry<K, V> {
  K key;
  V value;
  Entry({required this.key, required this.value});
}

void main() {
  HashTable obj = HashTable(length: 4);
  String name = 'akash maroli';
  obj.add('shanu', 'name');
  obj.add('kunnu', 'special');
  obj.add('loola', 'character');
  obj.add('chillara paisha', 'lose');
  obj.display();
  // obj.removeDuplicates(name.split(' ').join().split(''));
  // print(obj.keyUseToFindValue('kunnu'));
  // obj.frequency('akash'.split(''));
  // obj.display();
}
