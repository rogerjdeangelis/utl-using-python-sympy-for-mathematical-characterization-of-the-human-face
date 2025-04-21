%let pgm=utl-using-python-sympy-for-mathematical-characterization-of-the-human-face;

%stop_submission;

Using python sympy for mathematical characterization of the human face

graphic output
https://tinyurl.com/v8f935th
https://github.com/rogerjdeangelis/utl-using-python-sympy-for-mathematical-characterization-of-the-human-face/blob/main/face.png

github
https://tinyurl.com/4bjxpw5h
https://github.com/rogerjdeangelis/utl-using-python-sympy-for-mathematical-characterization-of-the-human-face

SOAPBOX ON

I realize this is an absurd representation of a human face, however
it demonstates a possible transformation of visual information into
well defined mathematical objects, like elipse, arcs, waves and lines.

FOR INSTANCE (most of these quations have charateristics like
 major and minor axes, radii, lengths, radians, color wheels ...)

face_eq      = Eq(x**2 + y**2, 1)
left_eye_eq  = Eq((x + 0.3)**2/0.05 + (y - 0.2)**2/0.07, 1)
right_eye_eq = Eq((x - 0.3)**2/0.05 + (y - 0.2)**2/0.07, 1)
x_brow       = np.linspace(-0.45, -0.15, 50)
mouth_eq     = Eq(x**2/0.3 + (y + 0.3)**2/0.1, 1)

SAPBOX OFF

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

CREATE AN SIMPLIFIES HUMAN FACE

+------------------------------+
|                              |
|       #############          |
|       ##         ##          |
|       #  ~~   ~~  #          |
|       #  ()   ()  #          |
|       (     ^     )          |
|        |         |           |
|        |  {===}  |           |
|         \       /            |
|        /  -----  \           |
|     ---  |%\ /%|  ---        |
|    /     |%%%%%|     \       |
|          |%/ \%|             |
|                              |
+------------------------------+

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

 face_eq      = Eq(x**2 + y**2, 1)
 left_eye_eq  = Eq((x + 0.3)**2/0.05 + (y - 0.2)**2/0.07, 1)
 right_eye_eq = Eq((x - 0.3)**2/0.05 + (y - 0.2)**2/0.07, 1)
 x_brow       = np.linspace(-0.45, -0.15, 50)
 mouth_eq     = Eq(x**2/0.3 + (y + 0.3)**2/0.1, 1)

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%utlfkil(d:/png/plots.png)

%utl_pybeginx;
parmcards4;
import numpy as np
import matplotlib.pyplot as plt
from sympy import symbols, Eq, solve, sqrt
from sympy.utilities.lambdify import lambdify

# Set up the figure
plt.figure(figsize=(6, 6))
plt.axis('equal')
plt.xlim(-1.2, 1.2)
plt.ylim(-1.2, 1.2)
plt.title('Simplified Human Face using SymPy'
 ,fontsize=12)
plt.grid(False)
plt.axis('off')

# Define symbolic variables
x, y = symbols('x y')

## 1. Face Outline (circle)
face_eq = Eq(x**2 + y**2, 1)  # Circle equation
face_y = solve(face_eq, y)
face_func_pos = lambdify(x, face_y[0], 'numpy')
face_func_neg = lambdify(x, face_y[1], 'numpy')

x_vals = np.linspace(-1, 1, 200)
plt.fill_between(x_vals
  ,face_func_neg(x_vals)
  ,face_func_pos(x_vals)
  ,color='peachpuff', alpha=0.8)
## 2. Eyes (ellipses)
# Left eye
left_eye_eq = Eq((x + 0.3)**2/0.05 + (y - 0.2)**2/0.07, 1)
left_eye_y = solve(left_eye_eq, y)
left_eye_pos = lambdify(x, left_eye_y[0], 'numpy')
left_eye_neg = lambdify(x, left_eye_y[1], 'numpy')

# Right eye
right_eye_eq = Eq((x - 0.3)**2/0.05 + (y - 0.2)**2/0.07, 1)
right_eye_y = solve(right_eye_eq, y)
right_eye_pos = lambdify(x, right_eye_y[0], 'numpy')
right_eye_neg = lambdify(x, right_eye_y[1], 'numpy')

x_eye = np.linspace(-0.3-0.25, -0.3+0.25, 100)
plt.fill_between(x_eye, left_eye_neg(x_eye), left_eye_pos(x_eye), color='white')
plt.fill_between(x_eye + 0.6, right_eye_neg(x_eye), right_eye_pos(x_eye), color='white')

# Pupils (circles)
plt.plot(-0.3, 0.2, 'ko', markersize=6)
plt.plot(0.3, 0.2, 'ko', markersize=6)

## 3. Eyebrows (linear equations)
x_brow = np.linspace(-0.45, -0.15, 50)
plt.plot(x_brow, 0.35 - 0.2*(x_brow + 0.3), 'k-', linewidth=3)
plt.plot(x_brow + 0.6, 0.35 - 0.2*(x_brow + 0.3), 'k-', linewidth=3)

## 4. Nose (triangle)
plt.plot([0, 0.1, 0], [0.1, -0.2, -0.2], 'k-', linewidth=2)

## 5. Mouth (semicircle)
mouth_eq = Eq(x**2/0.3 + (y + 0.3)**2/0.1, 1)
mouth_y = solve(mouth_eq, y)
mouth_pos = lambdify(x, mouth_y[0], 'numpy')

x_mouth = np.linspace(-0.55, 0.55, 100)
plt.plot(x_mouth, mouth_pos(x_mouth), 'r-', linewidth=3)

plt.tight_layout()
plt.savefig('d:/png/face.png')
plt.close()
;;;;
%utl_pyendx;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/************************************************************************************************************************************/
/* graphic output                                                                                                                   */
/* https://tinyurl.com/v8f935th                                                                                                     */
/* https://github.com/rogerjdeangelis/utl-using-python-sympy-for-mathematical-characterization-of-the-human-face/blob/main/face.png */
/*                                                                                                                                  */
/* RELATED PICTURE                                                                                                                  */
/*                                                                                                                                  */
/* +------------------------------+                                                                                                 */
/* |                              |                                                                                                 */
/* |       #############          |                                                                                                 */
/* |       ##         ##          |                                                                                                 */
/* |       #  ~~   ~~  #          |                                                                                                 */
/* |       #  ()   ()  #          |                                                                                                 */
/* |       (     ^     )          |                                                                                                 */
/* |        |         |           |                                                                                                 */
/* |        |  {===}  |           |                                                                                                 */
/* |         \       /            |                                                                                                 */
/* |        /  -----  \           |                                                                                                 */
/* |     ---  |%\ /%|  ---        |                                                                                                 */
/* |    /     |%%%%%|     \       |                                                                                                 */
/* |          |%/ \%|             |                                                                                                 */
/* |                              |                                                                                                 */
/* +------------------------------+                                                                                                 */
/************************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
