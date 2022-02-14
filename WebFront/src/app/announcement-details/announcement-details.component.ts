import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute,  Router, RouterLink} from '@angular/router';
import { Announcement } from '../announcement';
import { AnnouncementService } from '../announcement.service';

@Component({
  selector: 'app-announcement-details',
  templateUrl: './announcement-details.component.html',
  styleUrls: ['./announcement-details.component.scss']
})
export class AnnouncementDetailsComponent implements OnInit {

  public annonce?: Announcement;
  public isMobile?: boolean;

  constructor(private annonceService: AnnouncementService, private route: ActivatedRoute, private router: Router) {
   }

  ngOnInit(): void {
    const routeParams = this.route.snapshot.paramMap;
    const annonceId = Number(routeParams.get('annonceId'));
    this.annonce = this.annonceService.getAnnouncement(annonceId);
    this.annonceService.isMobile$.subscribe((isMobile) => this.isMobile = isMobile);
  }

  goToMapPage() {
    this.router.navigate(["map/",this.annonce?.id,"detail"]);
  }

  goBack() {
    this.router.navigate(["annonces"]);
  }
}
