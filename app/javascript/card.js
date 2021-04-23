const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const form = document.getElementById("charge-form");
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const formResult = document.getElementById("charge-form");//フォームの情報取得
      const formData = new FormData(formResult);//フォームの情報取得
      const card = {//フォームの情報取得
        number: formData.get("item_user_information[number]"),//フォームの情報取得
        cvc: formData.get("item_user_information[cvc]"),//フォームの情報取得
        exp_month: formData.get("item_user_information[exp_month]"),//フォームの情報取得
        exp_year: `20${formData.get("item_user_information[exp_year]")}`,//フォームの情報取得
      };
      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden"> `;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("charge-form").submit();
      });
    }); 
  };
  window.addEventListener("load", pay);
