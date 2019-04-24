export const fetchSearchGiphys = (query) => (
    $.ajax({
        method: 'GET',
        url: `http://api.giphy.com/v1/gifs/search?q=${query}&api_key=c73aoTGzdjizIYFN92ssMbXWCr2BI2cW&limit=2`
    })
);