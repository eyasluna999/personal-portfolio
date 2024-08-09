<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script>
function CheckContact(val){
 var element=document.getElementById('email');
 if(val=='email')
   element.style.display='block';
 else
   element.style.display='none';

 var element=document.getElementById('sms');
 if(val=='sms')
   element.style.display='block';
 else
   element.style.display='none';
}
</script>
    </script>
</head>
<body>
<select name="contactinfo" id="contactinfo" onchange="CheckContact(this.value);">
  <option>Select Contact Option</option>
  <option value="email">Email</option>
  <option value="sms">Text (SMS)</option>
</select><br />
<div id="email" style="display: none;">Enter Email: <input type="text" name="email" /><br /></div>
<div id="sms" style="display: none;">Enter Cell Number: <input type="text" name="sms" /><br /></div>
</body>
</html>