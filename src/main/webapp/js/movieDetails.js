// Function to update total price based on selected seats
function updateTotalPrice() {
  const seatElements = document.querySelectorAll('input[name="selectedSeats"]:checked');
  const total = seatElements.length * 10; // Assume each seat is $10
  document.getElementById("totalPrice").innerText = "$" + total.toFixed(2);
}

// Function to submit seats for booking
function submitSeats() {
  const showDate = document.getElementById("showDate").value;
  const totalPrice = document.getElementById("totalPrice").textContent;
  const movieId = "<%= movieIdParam %>"; // Pass movieId from JSP

  if (!showDate) {
    alert("Please select a date to watch the movie.");
    return;
  }

  const selectedSeats = [];
  document.querySelectorAll('input[name="selectedSeats"]:checked').forEach(seat => {
    selectedSeats.push(seat.value);
  });

  document.getElementById("selectedSeats").value = JSON.stringify(selectedSeats);
  document.getElementById("totalPriceInput").value = totalPrice;
  document.getElementById("showDateInput").value = showDate;
  document.getElementById("showTimeInput").value = document.getElementById("showTime").value;
  document.getElementById("seatForm").submit();
}
