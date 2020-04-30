/**
 * Partial implementation of Update bullets (before and after)
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 */
public abstract class OnUpdateBullet implements OnBeforeBullet, OnAfterBullet {
  protected Set<SObject> newSet { get; private set; }
  protected Set<SObject> oldSet { get; private set; }
  protected Map<ID, SObject> newMap { get; private set; }
  protected Map<ID, SObject> oldMap { get; private set; }

  @SuppressWarnings('PMD.EmptyStatementBlock')
  private OnUpdateBullet() {
  }

  /**
   * Creates an OnUpdateBullet with a Set of Objects
   * @param newSet Set of SObjects expected to be passed (e.g. Trigger.new)
   */
  public OnUpdateBullet(Set<SObject> newSet) {
    this(newSet, null);
  }

  /**
   * Creates an OnUpdateBullet with two Set of Objects
   * @param newSet Set of SObjects expected to be passed (e.g. Trigger.new)
   * @param oldSet Set of SObjects expected to be passed (e.g. Trigger.old)
   */
  public OnUpdateBullet(Set<SObject> newSet, Set<SObject> oldSet) {
    this.newSet = newSet;
    this.oldSet = oldSet;
  }

  /**
   * Creates an OnUpdateBullet with a Map of Id -> Objects
   * @param newMap Map of Id -> SObject expected to be passed (e.g. Trigger.newMap)
   */
  public OnUpdateBullet(Map<ID, SObject> newMap) {
    this(newMap, null);
  }

  /**
   * Creates an OnUpdateBullet with two Maps of Id -> Objects
   * @param newMap Map of Id -> SObject expected to be passed (e.g. Trigger.newMap)
   * @param oldMap Map of Id -> SObject expected to be passed (e.g. Trigger.oldMap)
   */
  public OnUpdateBullet(Map<ID, SObject> newMap, Map<ID, SObject> oldMap) {
    this.newMap = newMap;
    this.oldMap = oldMap;
  }

  /**
   * Takes the TriggerOperation to fire off on `BEFORE_UPDATE` and `AFTER_UPDATE`
   * @param fireWhen System.TriggerOperation
   * @param propellant Propellant object not in use here
   * @returns `Boolean`
   */
  public virtual Boolean canFire(TriggerOperation triggerWhen, Propellant propellant) {
    return triggerWhen == TriggerOperation.BEFORE_UPDATE ||
      triggerWhen == TriggerOperation.AFTER_UPDATE;
  }
}
