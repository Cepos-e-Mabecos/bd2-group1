count = 0;
document.querySelector("#add-comsumption").addEventListener('click', () => {
    if (count < 4) {
        var newcontent = document.createElement('input');
        newcontent.classList = 'form-control comsuption-input';
        // let innerHTML =`<input type="text" class="form-control" id="comsuption-${count}" placeholder="Name of Restaurant">`;
        document.querySelector('.comsumption-zone').appendChild(newcontent);
    }
    count++;
});
/*When submit button is pressed the fetch function will be triggered */
document.querySelector('#submit-button').addEventListener('click', (event) => {
    event.preventDefault();
    fetch("http://localhost:5001/restaurant/", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            designation: document.querySelector('#name-input').value,
            local_cod: document.querySelector('#local-input').value
            })
        })
        .then((res) => res.json())
        .then((data) => console.log(data))
        .then(
            bubadeira
        )
        .catch((err) => console.log(err))
    location.reload;
});


