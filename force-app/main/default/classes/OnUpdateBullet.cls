public abstract class OnUpdateBullet implements OnBeforeBullet, OnAfterBullet {
  protected Set<SObject> newSet { get; private set; }
  protected Set<SObject> oldSet { get; private set; }
  protected Map<ID, SObject> newMap { get; private set; }
  protected Map<ID, SObject> oldMap { get; private set; }

  @SuppressWarnings('PMD.EmptyStatementBlock')
  private OnUpdateBullet() {
  }
  public OnUpdateBullet(Set<SObject> newSet) {
    this(newSet, null);
  }
  public OnUpdateBullet(Set<SObject> newSet, Set<SObject> oldSet) {
    this.newSet = newSet;
    this.oldSet = oldSet;
  }
  public OnUpdateBullet(Map<ID, SObject> newMap) {
    this(newMap, null);
  }
  public OnUpdateBullet(Map<ID, SObject> newMap, Map<ID, SObject> oldMap) {
    this.newMap = newMap;
    this.oldMap = oldMap;
  }
  public virtual Boolean canFire(TriggerOperation triggerWhen, Propellant propellant) {
    return triggerWhen == TriggerOperation.BEFORE_UPDATE ||
      triggerWhen == TriggerOperation.AFTER_UPDATE;
  }
}
