import { Component, OnInit } from '@angular/core';
import { Announcement } from '../announcement';
import { AnnouncementService } from '../announcement.service';
import { Help } from '../help-definition/help';
import { HelpService } from '../help-definition/help.service';

@Component({
  selector: 'app-announcement-list',
  templateUrl: './announcement-list.component.html',
  styleUrls: ['./announcement-list.component.scss']
})
export class AnnouncementListComponent implements OnInit {

  public annonces: Announcement[] = [];
  public helps: Help[] = [];
  
  constructor(private annonceService: AnnouncementService, private helpService: HelpService) { 
    this.annonceService.annonces$.subscribe((annonces) => this.annonces = annonces);
    this.helpService.helps$.subscribe((helps) => this.helps = helps);
  }

  ngOnInit(): void {
  }

}
