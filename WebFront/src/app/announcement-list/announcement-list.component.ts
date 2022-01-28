import { Component, OnInit } from '@angular/core';
import { Announcement } from '../announcement';
import { AnnouncementService } from '../announcement.service';

@Component({
  selector: 'app-announcement-list',
  templateUrl: './announcement-list.component.html',
  styleUrls: ['./announcement-list.component.scss']
})
export class AnnouncementListComponent implements OnInit {

  public annonces: Announcement[] = [];

  constructor(private annonceService: AnnouncementService) { 
    this.annonceService.annonces$.subscribe((annonces) => this.annonces = annonces);
  }

  ngOnInit(): void {
  }

}
