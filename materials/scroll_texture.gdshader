shader_type canvas_item;

uniform float scroll_speed;

void vertex() {
	UV.x += TIME * scroll_speed;
}