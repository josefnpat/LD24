/*
extern number time;
extern number distortion;

vec4 effect(vec4 color, Image tex, vec2 tc, vec2 pc)
{
   // play with parameters here:
   tc.x += sin(tc.y * 100 + time * 10.0) * .03  * distortion;
   return Texel(tex,tc);
}
*/

/*
extern vec2 chroma;
extern vec2 imageSize;

vec4 effect(vec4 color, Image tex, vec2 tc, vec2 pc)
{
   vec2 shift = chroma / imageSize;
   return vec4(Texel(tex, tc+shift).r, Texel(tex,tc).g, Texel(tex,tc-shift).b, 1.0);
}
*/


vec4 effect(vec4 color, Image tex, vec2 tc, vec2 pc)
{
   tc = vec2(1.0,1.0) - abs(2.0 * tc - vec2(1.0,1.0)); // tc.x = 0 ... 1 ... 0
   return vec4(Texel(tex, tc));
}

/*

extern number time;
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords)
{
    return vec4((1.0+sin(time))/2.0, abs(cos(time)), abs(sin(time)), 1.0);
}
*/
