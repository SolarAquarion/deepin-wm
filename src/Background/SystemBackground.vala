//
//  Copyright (C) 2013 Tom Beckmann, Rico Tzschichholz
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

namespace Gala
{
	public class SystemBackground : Meta.BackgroundActor
	{
		public SystemBackground ()
		{
			Object ();
		}

		construct
		{
			var filename = AppearanceSettings.get_default ().workspace_switcher_background;
			var default_file = Config.PKGDATADIR + "/texture.png";

			if (filename == "") {
				filename = default_file;
			} else if (!FileUtils.test (filename, FileTest.IS_REGULAR)) {
				warning ("Failed to load %s", filename);
				filename = default_file;
			}

			var cache = BackgroundCache.get_default ();
			cache.load_image.begin (filename, 0,
				GDesktop.BackgroundStyle.WALLPAPER, (obj, res) => {
				content = cache.load_image.end (res);
			});
		}
	}
}

