let urlList = [
    'editForm',
    'myWishList?memberId=' + memberId + '&page=1',
    'myReservations?memberId=' + memberId + '&page=1',
    'myBoards?memberId=' + memberId + '&page=1',
    'myTradeList?memberId=' + memberId + '&page=1'
];

let btn = document.querySelectorAll('.btn');

btn.forEach((e, i) => {
    e.onclick = () => {
        location.href = urlList[i];
    };
});



