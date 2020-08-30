const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("form-charge");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("form-charge");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
      cvc: formData.get("cvc"),
    };

    Payjp.createToken(card, (status, response) => {

      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("form-charge");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");

        document.getElementById("form-charge").submit();
        document.getElementById("form-charge").reset();
      } else {
        document.getElementById("form-charge").submit();
        document.getElementById("form-charge").reset();
      }
    });
  });
};

window.addEventListener("load", pay);