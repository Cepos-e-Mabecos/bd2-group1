document.querySelector('#submit-button').addEventListener('click', async (event) => {
    event.preventDefault();
    console.log(document.querySelector("#nif-input").value);
    const fetchResponse = await fetch("http://localhost:5001/client/", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            nif: document.querySelector("#nif-input").value,
            first_name: document.querySelector('#firstName-input').value,
            last_name: document.querySelector('#lastName-input').value
        })
    });
    const data =  await fetchResponse.json();
    console.log(data);
    window.location.href = "http://localhost:5000/readClient";
       
});