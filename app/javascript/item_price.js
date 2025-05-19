const price = () => {
  const priceInput = document.getElementById("item-price");

  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value);

    const taxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    if (inputValue >= 300 && inputValue <= 9999999) {
      const tax = Math.floor(inputValue * 0.1);
      const profit = inputValue - tax;
      taxDom.innerHTML = tax.toLocaleString();
      profitDom.innerHTML = profit.toLocaleString();
    } else {
      taxDom.innerHTML = '';
      profitDom.innerHTML = '';
    }
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);