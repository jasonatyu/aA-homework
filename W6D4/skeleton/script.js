document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const place_form = document.getElementsByTagName("form");
  place_form[0].addEventListener("submit", event => {
    event.preventDefault();
    const place_input = document.getElementsByClassName("favorite-input");
    const favorite_place = place_input[0].value;
    place_input[0].value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = favorite_place;
    
    ul.appendChild(li);

  });

  // adding new photos

  // --- your code here!

  const photo_form = document.getElementsByClassName("photo-show-button");
  photo_form[0].addEventListener("click", event => {
    console.log("clicked");
    event.preventDefault();
    const form_container = document.getElementsByClassName("photo-form-container");
    if (form_container[0].classList.contains("hidden")) {
      form_container[0].classList.remove("hidden");
    } else {
      form_container[0].classList.add("hidden");
    }

    const submit = form_container[0].getElementsByTagName("form");
    submit[0].addEventListener("submit", event => {
      event.preventDefault();
      const photo_url_input = submit[0].getElementsByClassName("photo-url-input");
      const photo_url = photo_url_input[0].value;
      photo_url_input[0].value = "";
      const ul = document.getElementsByClassName("dog-photos");
      const li = document.createElement("li");
      const img = document.createElement("img");
      img.src = photo_url;
      li.appendChild(img);
      ul[0].appendChild(li);
    });
  });
});
