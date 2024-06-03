let urlList = [
    'editForm',
    'myWishList?page=1',
    'myReservations?page=1',
    'myBoards?page=1',
    'myTradeList?page=1'
];

let btn = document.querySelectorAll('.btn');

btn.forEach((e, i) => {
    e.onclick = () => {
        location.href = urlList[i];
    };
});



