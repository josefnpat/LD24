extern number time;
extern number distortion;

vec4 effect(vec4 color, Image tex, vec2 tc, vec2 pc)
{
   // play with parameters here:
   tc.x += sin(tc.y * 10 + time * 100) * .01  * distortion;
   tc.y += sin(tc.y * 10 + time * 100) * .01  * distortion;
   return Texel(tex,tc);
}
