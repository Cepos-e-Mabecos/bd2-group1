document.querySelector('#submit-button').addEventListener('click', async (event) => {
    event.preventDefault();
    const fetchResponse = await fetch("http://localhost:5001/employee/", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            first_name: document.querySelector('#firstName-input').value,
            last_name: document.querySelector('#lastName-input').value
        })
    });
    const data =  await fetchResponse.json();
    console.log(data);
    window.location.href = "http://localhost:5000/readEmployee";
       
});