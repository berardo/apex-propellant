/**
 * Defines what before bullets have to do
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 * @see Bullet
 */
public interface OnBeforeBullet extends Bullet {
  /**
   * Implement here your before trigger logic
   */
  void onBeforeFire();
}
