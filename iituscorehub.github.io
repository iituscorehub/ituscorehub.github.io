<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Калькулятор баллов</title>

<style>
* {
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    padding: 12px;
    margin: 0;
    background: #ffffff;
    color: #111;
}

.container {
    max-width: 420px;
    margin: auto;
}

h2 {
    color: #c40000;
    text-align: center;
    margin-bottom: 20px;
}

label {
    font-size: 14px;
    margin-top: 12px;
    display: block;
}

input {
    width: 100%;
    padding: 14px;
    margin-top: 6px;
    border-radius: 12px;
    border: 1px solid #c40000;
    font-size: 16px;
}

button {
    width: 100%;
    padding: 16px;
    margin-top: 18px;
    border-radius: 14px;
    border: none;
    background: #c40000;
    color: #fff;
    font-size: 17px;
    cursor: pointer;
}

#result {
    margin-top: 20px;
    padding: 14px;
    border-radius: 12px;
    background: #f9f9f9;
    color: #c40000;
    text-align: center;
    font-size: 16px;
    white-space: pre-line;
}

/* Дополнительно для очень маленьких экранов */
@media (max-width: 360px) {
    h2 {
        font-size: 18px;
    }
    input, button {
        font-size: 15px;
        padding: 13px;
    }
}
</style>
</head>

<body>
<div class="container">

<h2>Калькулятор баллов МУИТ</h2>

<label>РК1</label>
<input type="number" id="rk1" placeholder="0–100">

<label>РК2</label>
<input type="number" id="rk2" placeholder="0–100">

<label>Экзамен</label>
<input type="number" id="exam" placeholder="0–100">

<button onclick="calc()">Посчитать</button>

<div id="result"></div>

</div>

<script>
function calc() {
    const rk1 = Number(document.getElementById('rk1').value) || 0;
    const rk2 = Number(document.getElementById('rk2').value) || 0;
    const exam = Number(document.getElementById('exam').value) || 0;

    const total = rk1 * 0.3 + rk2 * 0.3 + exam * 0.4;

    let text = `Итоговый балл: ${total.toFixed(2)}`;

    const neededExam = (70 - (rk1 * 0.3 + rk2 * 0.3)) / 0.4;

    if (neededExam <= 0) {
        text += `\n70 уже обеспечены`;
    } else if (neededExam > 100) {
        text += `\nНабрать 70 невозможно`;
    } else {
        text += `\nДля 70 нужно на экзамене: ${neededExam.toFixed(2)}`;
    }

    document.getElementById('result').textContent = text;
}
</script>

</body>
</html>
