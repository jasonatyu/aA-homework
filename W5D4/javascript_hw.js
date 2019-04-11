function madLib(verb, adjective, noun) {
    return "We shall " + verb.toUpperCase() + " the " + adjective.toUpperCase() + " " + noun.toUpperCase();
}

function isSubstring(search, sub) {
    if (search.includes(sub)) {
        return true;
    } else {
        return false;
    }
}

function fizzBuzz(array) {
    const res = [];
    for (i = 0; i < array.length; i++) {
        if ((array[i] % 3 == 0 || array[i] % 5 == 0) && !(array[i] % 3 == 0 && array[i] % 5 == 0)) {
            res.push(array[i]);
        }
    }
    return res 
}

function isPrime(n) {
    if (n < 2) {
        return false;
    }
    for (i = 2; i < n; i++) {
        if (n % i == 0 ) {
            return false;
        }
    }
    return true;
}

function firstNPrimes(n) {
    const arr = [];
    let i = 2
    while (arr.length < n) {
        if (isPrime(i)) {
            arr.push(i)
        }
        i++
    }
    return arr;
}

function sumOfNPrimes(n) {
    if (n == 0) {
        return 0;
    }
    const first_n_primes = firstNPrimes(n);
    return first_n_primes.reduce((a, b) => a + b);
}

function titleize(names, cb) {
    cb(names.map((name) => "Mx. " + name + " Jingleheimer Schmidt"));
}

function printCallback(arr) {
    for (i = 0; i < arr.length; i++) {
        console.log(arr[i]);
    }
}

titleize(["Mary", "Brian", "Leo"], printCallback);

function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;

    Elephant.prototype.trumpet = function () {
        console.log(this.name + ' the elephant goes phrRRRRRRRRRRR!!!!!!!');
    };

    Elephant.prototype.grow = function () {
        this.height += 12;
    };

    //this doesn't work
    Elephant.prototype.addTrick(trick) = function () {
        this.tricks.push(trick);
    };

    Elephant.prototype.play = function () {
        console.log(this.name + ' is ' + this.tricks[Math.floor(Math.random() * this.tricks.length)])
    };
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah].forEach(paradeHelper);

function paradeHelper(elephant) {
    console.log(elephant.name + ' is trotting by!');
}

//how to add please
function dinerBreakfast() {
    let order = "I'd like cheesy scrambled eggs"
    return (item) => order = order + " and " + item
}
