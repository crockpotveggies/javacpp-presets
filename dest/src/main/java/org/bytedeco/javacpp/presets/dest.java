package org.bytedeco.javacpp.presets;

import org.bytedeco.javacpp.annotation.*;
import org.bytedeco.javacpp.tools.*;

/**
 * @author Justin Long (crockpotveggies)
 */
@Properties(target="org.bytedeco.javacpp.dest", value={@Platform(include="<inc/dest/dest.h>", link="dest@.8"),
    @Platform(value="macosx-x86_64", link="dest", preload="libdest.a")})
public class dest implements InfoMapper {
  public void map(InfoMap infoMap) {
  }
}