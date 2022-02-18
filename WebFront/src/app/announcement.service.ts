import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { ANNOUCEMENTS } from './annoucements.mock';
import { Announcement } from './announcement';

@Injectable({
  providedIn: 'root'
})
export class AnnouncementService {

  private annonces: Announcement[] = ANNOUCEMENTS;
  private isMobile: boolean = false;
  public annonces$: BehaviorSubject<Announcement[]> = new BehaviorSubject(this.annonces);
  public isMobile$: BehaviorSubject<boolean> = new BehaviorSubject(this.isMobile);

  constructor() { }

  getAnnouncement(annonceId: Number) {
    let annonce;
    annonce = this.annonces.find((annonce) => annonce.id === annonceId);
    return annonce;
  }

}
