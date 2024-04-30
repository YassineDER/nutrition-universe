function calculate() {
    var bmi; var result = document.getElementById("resultbmi");
    var weight = parseInt(document.getElementById("weight").value);

    document.getElementById("weight-val").textContent = weight + " kg";

    var height = parseInt(document.getElementById("height").value);
    document.getElementById("height-val").textContent = height + " cm";

    bmi = (weight / Math.pow((height / 100), 2)).toFixed(1);
    result.textContent = bmi;

    if (bmi < 18.5)
    {
        category = "Poids insuffisant";
        result.style.color = "#3fb2f5";
        rotateWrap.style.transform = "rotate(19deg)";
        bgbmicolor1.style.animation = "blinkingBackground1 2s infinite";
        bgbmicolor2.style.animation = "none";
        bgbmicolor3.style.animation = "none";
        bgbmicolor4.style.animation = "none"
    }
    else if (bmi >= 18.5 && bmi <= 24.9)
    {
        category = "Poids normal";
        result.style.color = "#44b029";
        rotateWrap.style.transform = "rotate(54deg)";
        bgbmicolor2.style.animation = "blinkingBackground2 2s infinite";
        bgbmicolor1.style.animation = "none";
        bgbmicolor3.style.animation = "none";
        bgbmicolor4.style.animation = "none"
    }
    else if (bmi >= 25 && bmi <= 29.9)
    {
        category = "Surpoids";
        result.style.color = "#feb30c";
        rotateWrap.style.transform = "rotate(85deg)";
        bgbmicolor3.style.animation = "blinkingBackground3 2s infinite";
        bgbmicolor1.style.animation = "none";
        bgbmicolor2.style.animation = "none";
        bgbmicolor4.style.animation = "none"
    }
    else if (bmi >= 30 && bmi <= 34.9)
    {
        category = "Obésité";
        result.style.color = "#ff3f32";
        rotateWrap.style.transform = "rotate(118deg)";
        bgbmicolor4.style.animation = "blinkingBackground4 2s infinite";
        bgbmicolor1.style.animation = "none";
        bgbmicolor2.style.animation = "none";
        bgbmicolor3.style.animation = "none"
    }
    else
    {
        category = "Obésité";
        result.style.color = "#de0000";
        rotateWrap.style.transform = "rotate(156deg)";
        bgbmicolor4.style.animation = "blinkingBackground4 2s infinite";
        bgbmicolor1.style.animation = "none";
        bgbmicolor2.style.animation = "none";
        bgbmicolor3.style.animation = "none"
    }

    document.getElementById("categorybmi").textContent = category
};