let urlList = [
    'editForm',
    'myWishList',
    'myReservations',
    'myBoards',
    'myTradeList'
];

let btn = document.querySelectorAll('.btn');

btn.forEach((e, i) => {
    e.onclick = () => {
        location.href = urlList[i];
    };
});



