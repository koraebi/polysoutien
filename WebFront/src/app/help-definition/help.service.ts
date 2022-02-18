import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { HELPS } from './help.mock';
import { Help } from './help';

@Injectable({
  providedIn: 'root'
})
export class HelpService {

  private helps: Help[] = HELPS;
  public helps$: BehaviorSubject<Help[]> = new BehaviorSubject(this.helps);

  constructor() { }

  getHelp(helpId: Number) {
    let help;
    help = this.helps.find((help) => help.id === helpId);
    return help;
  }


}
