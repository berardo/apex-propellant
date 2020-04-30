/**
 * Defines what after bullets have to do
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 * @see Bullet
 */
public interface OnAfterBullet extends Bullet {
  /**
   * Implement here your after trigger logic
   */
  void onAfterFire();
}
