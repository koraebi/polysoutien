import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Announcement } from '../announcement';
import { AnnouncementService } from '../announcement.service';

@Component({
  selector: 'app-announcement-details',
  templateUrl: './announcement-details.component.html',
  styleUrls: ['./announcement-details.component.scss']
})
export class AnnouncementDetailsComponent implements OnInit {

  public annonce?: Announcement;

  constructor(private annonceService: AnnouncementService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    const routeParams = this.route.snapshot.paramMap;
    const annonceId = Number(routeParams.get('annonceId'));
    this.annonce = this.annonceService.getAnnouncement(annonceId);
  }

}
