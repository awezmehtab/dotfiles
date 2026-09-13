from kitty.fast_data_types import Screen
from kitty.tab_bar import DrawData, ExtraData, TabBarData, draw_title, as_rgb
from kitty.utils import color_as_int


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    # just for this :(
    screen.cursor.bg = as_rgb(color_as_int(draw_data.default_bg))
    screen.draw(f" {index} ")
    return screen.cursor.x
